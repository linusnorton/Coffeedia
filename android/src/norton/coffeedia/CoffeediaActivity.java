package norton.coffeedia;

import android.app.Activity;
import android.os.Bundle;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.WebView;

public class CoffeediaActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        requestWindowFeature(Window.FEATURE_NO_TITLE);        
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, 
                             WindowManager.LayoutParams.FLAG_FULLSCREEN);        

        
        WebView webview = new WebView(this);
        webview.getSettings().setAppCacheEnabled(true);
        webview.getSettings().setJavaScriptEnabled(true);
        webview.loadUrl("http://linusnorton.co.uk:8080/");
        
        setContentView(webview);
    }
}