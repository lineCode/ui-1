//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Mar 09, 2012  7:47:30 PM
// Author: tomyeh

/**
 * An activity is a UI, aka., a desktop, that the user can interact with.
 * An activity is identified with an URL.
 */
class Activity {
	Activity() {
		if (device === null)
			device = new Device();
	}

	/** Start the activity.
	 */
	void run() {
		if (activity !== null)
			throw const UiException("Only one activity is allowed");
		activity = this;
		View rootView = createRootView_();
		onCreate_(rootView);

		if (!rootView.inDocument) {//app might add it to Document manually
		  final Element cave = document.query("#v-root");
      rootView.addToDocument(cave != null ? cave: document.body);
		}
	}

	/** Called to instantiate the root view.
	 * Don't call this method directly. It is a callback that
	 * you can override to provide a different instance if necessary.
	 * <p>Default: it creates an instance of [Section] and initializes
	 * it to fill the whole screen.
	 */
	View createRootView_() {
		final View root = new Section();
		root.width = device.screen.width;
		root.height = device.screen.height;
		return root;
	}
	/** Called when the activity is starting.
	 * Notice that root is not attached to the screen yet when this method
	 * is called.
	 * Rather, it will be attached after this method returns (for better
	 * performance). However, if you'd like to attach it earlier, you can
	 * invoke [View.addToDocument].
	 */
	void onCreate_(View rootView) {
	}
	/** Called when the activity is going into background.
	 */
	void onPause_() {
	}
	/** Called when the activity is resumed to start interacting
	 * with the user.
	 */
	void onResume_() {
	}
	/** Called when the activity is destroyed.
	 */
	void onDestroy_() {
	}
}
/** The current activity. */
Activity activity;