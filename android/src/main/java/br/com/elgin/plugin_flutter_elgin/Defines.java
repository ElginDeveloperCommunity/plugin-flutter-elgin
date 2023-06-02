package br.com.elgin.plugin_flutter_elgin;

public class Defines {
    /////////////////////
    // flutter configs //
    /////////////////////
    public static final String CHANNEL = "elgin.plugin/e1";

    ///////////
    // Codes //
    ///////////
    public static final int IDH_INTENTS_ARRAY_REQUEST_CODE = 1000;
    public static final int IDH_INTENTS_OBJECT_REQUEST_CODE = 2000;

    ///////////////
    // functions //
    ///////////////

    public static final String INTENT = "intent";
    public static final String GET_PLATFORM_VERSION = "getPlatformVersion";

    //////////
    // keys //
    //////////
    public static final String COMANDO = "comando";
    public static final String RETORNO = "retorno";
    public static final String ARGUMENTS = "arguments";
    public static final String INTENT_PAYLOAD = "intentPayload";
    public static final String ACTIVITY_FILTER_PATH = "activityFilterPath";

    /////////////////////
    // Messages Errors //
    /////////////////////
    public static final String ERROR_MISSING_ARGUMENTS = "MissingArguments";
    public static final String ERROR_MISSING_ARGUMENTS_DESC = "Missing Arguments 'arguments' in invokeMethod";
    public static final String ERROR_ACTIVITY_NOT_FOUND = "ActivityNotFound";
    public static final String ERROR_ACTIVITY_NOT_FOUND_DESC = "No Activity to resolve";
    public static final String ERROR_NO_RETURN = "NO_RETURN";
    public static final String ERROR_NO_RETURN_DESC = "No return of function intent";
    public static final String ERROR_JSON_FORMAT = "JSON_FORMAT_ERROR";
    public static final String ERROR_JSON_FORMAT_DESC = "The JSON format is incorrect or DigitalHub App is not installed";
    public static final String ERROR_RESULT_CODE = "Intent_Not_Ok";
    public static final String ERROR_RESULT_CODE_DESC = "No return of function intent";

}
