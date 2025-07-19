import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class RollingMeanPaceApp extends Application.AppBase {
    var _model;

    function initialize() {
        AppBase.initialize();
        _model = new RollingMeanPaceModel();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new RollingMeanPaceView(_model) ];
    }

}

function getApp() as RollingMeanPaceApp {
    return Application.getApp() as RollingMeanPaceApp;
}