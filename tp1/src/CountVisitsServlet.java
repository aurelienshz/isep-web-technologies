import util.CookiesUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/countVisits")
public class CountVisitsServlet extends HttpServlet {
    private String VISITS_COOKIE_KEY = "visits";

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        CookiesUtils cookiesUtils = new CookiesUtils(req);

        Cookie visitsCookie = cookiesUtils.find(VISITS_COOKIE_KEY);

        Integer visits = 0;
        if (visitsCookie != null) {
            visits = Integer.parseInt(visitsCookie.getValue());
        }

        visits ++;
        resp.addCookie(new Cookie(VISITS_COOKIE_KEY, visits.toString()));
        out.println("Number of visits : " + visits);
    }
}
