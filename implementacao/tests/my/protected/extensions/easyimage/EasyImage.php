<?php

/**
 * EasyImage class file.
 * @author Artur Zhdanov <zhdanovartur@gmail.com>
 * @copyright Copyright &copy; Artur Zhdanov 2013-
 * @license http://www.opensource.org/licenses/bsd-license.php New BSD License
 * @version 0.9.1
 */
// Preload kohana image library
Yii::setPathOfAlias('easyimage', dirname(__FILE__));
Yii::import('easyimage.drivers.Image');
Yii::import('easyimage.drivers.GD', true);
Yii::import('easyimage.drivers.Imagick', true);

class EasyImage extends CApplicationComponent {

  // Resizing constraints

  const RESIZE_NONE = 0x01;
  const RESIZE_WIDTH = 0x02;
  const RESIZE_HEIGHT = 0x03;
  const RESIZE_AUTO = 0x04;
  const RESIZE_INVERSE = 0x05;
  const RESIZE_PRECISE = 0x06;

  private $_image;
  public $driver = 'GD'; // GD, Imagick
  public $quality = 100;
  public $cachePath = '/assets/'; //relative web root (default: /assets/)
  public $cacheTime = 2592000; // 30 days

  public function __construct($file = null, $driver = null) {
    if ($file) {
      return $this->_image = Image::factory($this->detectPath($file), $driver ? $driver : $this->driver);
    }
  }

  public function __toString() {
    try {
      // Render the current image
      return $this->image()->render();
    } catch (CException $e) {
      // Showing any kind of error will be "inside" image data
      return '';
    }
  }

  public function detectPath($file) {
    $fullPath = dirname(Yii::app()->basePath) . $file;
    if (is_file($fullPath)) {
      return $fullPath;
    }
    return $file;
  }

  /**
   * Getter of the Image.
   * @return Image The Image.
   * @throws CException No valid Images.
   */
  public function image() {
    if ($this->_image instanceof Image) {
      return $this->_image;
    } else {
      throw new CException('Don\'t have image');
    }
  }

  public function thumbOf($file, $params = array(), $htmlOptions = array()) {
    return CHtml::image($this->thumbSrcOf($file, $params), null, $htmlOptions);
  }

  public function thumbSrcOf($file, $params = array()) {
    // Paths
    $cachePath = dirname(Yii::app()->basePath) . $this->cachePath;
    $hash = md5($file . serialize($params));
    $subPath = 'easyimage' . '/' . $hash{0};
    $cacheFileName = $hash . '.' . (isset($params['type']) ? $params['type'] : pathinfo($file, PATHINFO_EXTENSION));
    $cacheFile = $cachePath . $subPath . '/' . $cacheFileName;
    $webCacheFile = Yii::app()->baseUrl . $this->cachePath . $subPath . '/' . $cacheFileName;

    // Return cache image URL
    if (file_exists($cacheFile) && (time() - filemtime($cacheFile) < $this->cacheTime)) {
      return $webCacheFile;
    }

    // Check permissions
    if (!is_dir($cachePath)) {
      throw new CException('Thumb cache directory not found.');
    }
    if (!is_writeable($cachePath)) {
      throw new CException('Thumb cache directory not writeable');
    }
    if (!is_dir($cachePath . $subPath)) {
      mkdir($cachePath . $subPath, 0755, true);
    }

    // Create and caching thumb by params
    $this->_image = Image::factory($this->detectPath($file), $this->driver);
    foreach ($params as $key => $value) {
      switch ($key) {
        case 'resize':
          $this->resize(
                  isset($value['width']) ? $value['width'] : NULL, isset($value['height']) ? $value['height'] : NULL, isset($value['master']) ? $value['master'] : NULL
          );
          break;
        case 'crop':
          if (!isset($value['width']) || !isset($value['height'])) {
            throw new CException('Params "width" and "height" is required for action "' . $key . '"');
          }
          $this->crop(
                  $value['width'], $value['height'], isset($value['offset_x']) ? $value['offset_x'] : NULL, isset($value['offset_y']) ? $value['offset_y'] : NULL
          );
          break;
        case 'rotate':
          if (is_array($value)) {
            if (!isset($value['degrees'])) {
              throw new CException('Param "degrees" is required for action "' . $key . '"');
            }
            $this->rotate($value['degrees']);
          } else {
            $this->rotate($value);
          }
          break;
        case 'sharpen':
          if (is_array($value)) {
            if (!isset($value['amount'])) {
              throw new CException('Param "amount" is required for action "' . $key . '"');
            }
            $this->sharpen($value['amount']);
          } else {
            $this->sharpen($value);
          }
          break;
        case 'reflection':
          $this->reflection(
                  isset($value['height']) ? $value['height'] : NULL, isset($value['opacity']) ? $value['opacity'] : 100, isset($value['fade_in']) ? $value['fade_in'] : FALSE
          );
          break;
        case 'watermark':
          if (is_array($value)) {
            $this->watermark(
                    isset($value['watermark']) ? $value['watermark'] : NULL, isset($value['offset_x']) ? $value['offset_x'] : NULL, isset($value['offset_y']) ? $value['offset_y'] : NULL, isset($value['opacity']) ? $value['opacity'] : 100
            );
          } else {
            $this->watermark($value);
          }
          break;
        case 'background':
          if (is_array($value)) {
            if (!isset($value['color'])) {
              throw new CException('Param "color" is required for action "' . $key . '"');
            }
            $this->background(
                    $value['color'], isset($value['opacity']) ? $value['opacity'] : 100
            );
          } else {
            $this->background($value);
          }
          break;
        case 'quality':
          if (!isset($value)) {
            throw new CException('Param "' . $key . '" can\'t be empty');
          }
          $this->quality = $value;
          break;
        case 'type':
          break;
        default:
          throw new CException('Action "' . $key . '" is not found');
      }
    }
    $this->save($cacheFile, $this->quality);
    return $webCacheFile;
  }

  //IDE AutoComplete methods (because factory pattern)

  public function resize($width = NULL, $height = NULL, $master = NULL) {
    return $this->image()->resize($width, $height, $master);
  }

  public function crop($width, $height, $offset_x = NULL, $offset_y = NULL) {
    return $this->image()->crop($width, $height, $offset_x, $offset_y);
  }

  public function rotate($degrees) {
    return $this->image()->rotate($degrees);
  }

  public function sharpen($amount) {
    return $this->image()->sharpen($amount);
  }

  public function reflection($height = NULL, $opacity = 100, $fade_in = FALSE) {
    return $this->image()->reflection($height, $opacity, $fade_in);
  }

  public function watermark($watermark, $offset_x = NULL, $offset_y = NULL, $opacity = 100) {
    if ($watermark instanceof EasyImage) {
      $watermark = $watermark->image();
    } elseif (is_string($watermark)) {
      $watermark = Image::factory(dirname(Yii::app()->basePath) . $watermark);
    }
    return $this->image()->watermark($watermark, $offset_x, $offset_y, $opacity);
  }

  public function background($color, $opacity = 100) {
    return $this->image()->background($color, $opacity);
  }

  public function save($file = NULL, $quality = 100) {
    return $this->image()->save($file, $quality);
  }

  public function render($type = NULL, $quality = 100) {
    return $this->image()->render($type, $quality);
  }

}
