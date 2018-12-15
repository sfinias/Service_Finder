package utils;
import model.RegisterEntity;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PageFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;

        RegisterEntity user = (RegisterEntity)req.getSession().getAttribute("user");
        System.out.println(req.getRequestURI());

        if(user==null && !req.getRequestURI().endsWith("checkLogin.htm") && !req.getRequestURI().endsWith("checkLogin.htm") && !req.getRequestURI().endsWith("initialForm.htm")){
            res.sendRedirect(req.getContextPath().concat("/user/initialForm.htm"));
        } else if(req.getRequestURI().endsWith("initialForm.htm") && user!=null){
            res.sendRedirect(req.getContextPath().concat("/user/search.htm"));
        }

        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }

}