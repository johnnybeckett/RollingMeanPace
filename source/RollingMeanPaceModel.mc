import Toybox.Application;
import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;
import Toybox.System;

class RollingMeanPaceModel  {
    var _conversion_factor;
    var _secondsToAverage;

    function initialize() {
        readSettings();
    }

    function readSettings() {
        _conversion_factor = (getApp().getProperty("useImperial") == true) ? 26.8224 : 16.6666666667;
        _secondsToAverage = getApp().getProperty("secondsToAverage");
    }

    function getConversionFactor()
    {
        return _conversion_factor;
    }

    function getSecondsToAverage()
    {
        return _secondsToAverage;
    }
}
