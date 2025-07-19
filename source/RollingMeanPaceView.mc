import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;
import Toybox.System;



class RollingMeanPaceView extends WatchUi.SimpleDataField {
    var secondsToAverage;
    var currentIndex;
    var previousValues as Array<Float>;
    var currentTotal;
    var conversion_factor;
    var _model;

    // Set the label of the data field here.
    function initialize(model) {
        SimpleDataField.initialize();
        _model = model;
        label = "RollAvg Pace";
        conversion_factor = _model.getConversionFactor();
        secondsToAverage = _model.getSecondsToAverage();
        currentIndex = 0;
        currentTotal = 0.0;
        previousValues = new Float[secondsToAverage];
        for (var i = 0; i < secondsToAverage; i++) {
            previousValues[i] = 0.0;
        }
    }

    // Convert the current time in minutes per km to display format
    function formatMinutesSeconds(timeInMinutes as Float) as String {
        var minutes = timeInMinutes.toNumber(); // Integer part: minutes
        var seconds = ((timeInMinutes - minutes) * 60).toNumber(); // Integer part: seconds
        // Pad seconds with leading zero if needed
        var secondsStr = seconds < 10 ? "0" + seconds.toString() : seconds.toString();
        return minutes.toString() + ":" + secondsStr;
    }

    // Called when new data is available
    function compute(info) {
        if (info != null && info.currentSpeed != null)
        {
            var speed = info.currentSpeed; // m/s
            if (speed > 0.0) {
                if ((speed < 0.5) || (speed > 8.5)) {
                    return "##:##";
                } else {
                    var pace = conversion_factor / info.currentSpeed;
                    currentTotal = currentTotal - previousValues[currentIndex] + pace;
                    previousValues[currentIndex] = pace;
                    currentIndex = (1 + currentIndex) % secondsToAverage;
                    return formatMinutesSeconds(currentTotal / secondsToAverage);
                }
            }
        }
        return "--:--";
    }
}
