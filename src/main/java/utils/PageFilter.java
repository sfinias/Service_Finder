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
//        System.out.println(req.getRequestURI());
//        System.out.println("Query String: " + req.getQueryString() );
        System.out.println("servletPath: " + req.getServletPath() );
//        System.out.println("Context PATH: " + req.getContextPath() );
//        System.out.println("GET METHOD: " + req.getMethod());
//        System.out.println("Get request URL: " + req.getRequestURL() );
//        System.out.println("Get path translated: " + req.getPathTranslated() );


        if(user == null && !(req.getServletPath().startsWith("/home") || req.getServletPath().startsWith("/verification") || req.getServletPath().equals("/index.jsp"))) {
            res.sendRedirect(req.getContextPath().concat("/home/initialForm.htm"));
        }

        if(user!=null){
            if(user.getUserEntity().getProfessionId()==1 && !req.getServletPath().startsWith("/user") ){
                res.sendRedirect(req.getContextPath().concat("/user/search.htm"));
            }
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