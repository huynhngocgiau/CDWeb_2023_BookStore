package com.cdweb.bookstore.config;

import com.cdweb.bookstore.service.impl.UserDetailServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class WebSecurityConfig {
    @Autowired
    private UserDetailServiceImp userDetailsService;

    @Bean
    public BCryptPasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeHttpRequests((authz) ->
                        authz.requestMatchers("/thanh-toan", "/gio-hang").hasRole("USER")
                                .requestMatchers("/admin-page/**").hasRole("ADMIN").anyRequest().permitAll())
                .formLogin().loginPage("/dang-nhap").loginProcessingUrl("/login").defaultSuccessUrl("/").failureUrl("/dang-nhap?error=true").usernameParameter("email").passwordParameter("password")
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/");
        http.authenticationProvider(authProvider());
        return http.build();
    }

    //thiết lập userDetailService với encoder
    @Bean
    public DaoAuthenticationProvider authProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(encoder());
        return authProvider;
    }
}
