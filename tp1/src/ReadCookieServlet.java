import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Set;

@WebServlet("/readCookies")
public class ReadCookieServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        PrintWriter out = resp.getWriter();

        ArrayList<String> cookieKeys = new ArrayList<String>() {{
            add("firstName");
            add("lastName");
            add("birth");
            add("gender");
        }};

        out.println("<html><body><ul>");
        for (Cookie c: cookies) {
            if (cookieKeys.contains(c.getName())) {
                out.println("<li><strong>" + c.getName() + " :</strong> " + c.getValue() + "</li>");
            }
        }
        out.println("</li><br /><a href=\"/formServlet\">Back</a>");
        out.println("</html></body>");
    }
}
