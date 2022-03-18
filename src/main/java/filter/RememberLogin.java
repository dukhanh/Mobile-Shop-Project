package filter;

import dao.AccountDAO;
import dao.AddressDAO;
import dao.CartDAO;
import mode_utility.Encrypt;
import model.Account;
import model.Address;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "RememberLogin")
public class RememberLogin implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        Cookie[] arr = req.getCookies();
        String email = "";
        String password = "";
        if (arr != null) {
            for (Cookie c : arr) {
                if (c.getName().equals("email")) {
                    email = c.getValue();
                }
                if (c.getName().equals("password")) {
                    password = c.getValue();
                }
            }
            Account account = AccountDAO.getInstance().Login(email, Encrypt.MD5(password));
            if (account.getStatus().equals("open")) {
                HttpSession session = req.getSession();
                session.setAttribute("account", account);
                session.setAttribute("quantityProductInCart", CartDAO.getInstance().sumQuantityProductInCart(account.getId()));
                Address address = AddressDAO.getInstance().getAddressByUserId(account.getId());
                session.setAttribute("address", address);
            }
        }
        chain.doFilter(request, response);
    }
}
