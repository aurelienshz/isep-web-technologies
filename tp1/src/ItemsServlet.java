import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/items")
public class ItemsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/itemsServlet.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArrayList<String> items;
        if (session.getAttribute("items") != null) {
            items = (ArrayList<String>) session.getAttribute("items");
        } else {
            items = new ArrayList<>();
        }
        if(req.getParameter("item") != null) {
            items.add(req.getParameter("item"));
        }

        session.setAttribute("items", items);
        req.getRequestDispatcher("/itemsServlet.jsp").forward(req, resp);
    }
}
