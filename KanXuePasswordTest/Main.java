public class Main {

    public static void main(String[] args) {
        String password = "KanXueLunTanKaolaSo";
        System.out.println(password);
        System.out.println(encodePassword(password));
        System.out.println("Hello World!");
    }

    private static String encodePassword(String password){
        return MD5(strToEnt(password.trim()));
    }

    private static String strToEnt(String input) {
        String output = "";

        for (int i = 0; i < input.length(); i++) {
            int ucode = input.codePointAt(i);
            String tmp = "";

            if (ucode > 255) {
                while (ucode >= 1) {
                    tmp = "0123456789".charAt(ucode%10) + tmp;
                    ucode /= 10;
                }

                if (tmp == "") {
                    tmp = "0";
                }

                tmp = "#" + tmp;
                tmp = "&" + tmp;
                tmp = tmp + ";";
                output += tmp;
            }else {
                output += input.charAt(i);
            }
        }
        return output;
    }

    public static String MD5(String md5) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
        }
        return null;
    }
}
