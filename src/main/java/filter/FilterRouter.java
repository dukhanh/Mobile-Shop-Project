package filter;

import model.Account;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin/*")
public class FilterRouter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String URL = httpRequest.getContextPath() + "/admin/";
        HttpSession session = httpRequest.getSession(false);

        Account account = (Account) session.getAttribute("account");

        boolean isAdminRequest = httpRequest.getRequestURI().contains(URL);

        if ((account == null || (!account.getRole().equals("admin"))) && isAdminRequest) {
            httpRequest.getRequestDispatcher("/customer/404-page.jsp").forward(httpRequest, httpResponse);
        } else {
            chain.doFilter(request, response);
        }
    }
}
