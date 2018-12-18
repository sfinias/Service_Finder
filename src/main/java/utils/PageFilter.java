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

//        if(user == null && !(req.getServletPath().startsWith("/home") || req.getServletPath().startsWith("/verification") || req.getServletPath().equals("/index.jsp"))) {
//            res.sendRedirect(req.getContextPath().concat("/home/initialForm.htm"));
//        }
//
//        if(user!=null){
//            if(user.getUserEntity().getProfessionId()==1 && !req.getServletPath().startsWith("/user") ){
//                res.sendRedirect(req.getContextPath().concat("/user/search.htm"));
//            }
//        }

        if(req.getServletPath().startsWith("/verification") || req.getServletPath().startsWith("/home")){
            if(user!=null){
                if(user.getUserEntity().getProfessionId()==1) res.sendRedirect(req.getContextPath().concat("/user/search.htm"));
            }
        }else if(req.getServletPath().startsWith("/user")){
            if(user==null) res.sendRedirect(req.getContextPath().concat("/home/initialForm.htm"));
            else if (user.getUserEntity().getProfessionId()!=1) System.out.println("Profess");
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