@Mixin(CrashReport.class)
public abstract class CrashReportMixin {
  @ModifyVariable(method = "generateWittyComment()Ljava/lang/String;", at = @At(value = "STORE", ordinal = 0), ordinal = 0)
  private static String[] addWittyComments(String[] orig) {
    String[] addedWittyComments = new String[]{"example", "example 2", "example 3"};
    String[] newStrings = new String[orig.length + addedWittyComments.length];
    System.arraycopy(orig, 0, newStrings, 0, orig.length);
    System.arraycopy(addedWittyComments, 0, newStrings, orig.length - 1, addedWittyComments.length);
    return newStrings;
  }
}
