package shop.mtcoding.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import shop.mtcoding.blog.dto.ResponseDto;
import shop.mtcoding.blog.model.User;
import shop.mtcoding.blog.model.UserRepository;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserRepository userRepository;

    @GetMapping("/joinForm")
    public String loginForm() {
        return "user/joinForm";
    }

    @GetMapping("/checkUsernameForJoin")
    public @ResponseBody ResponseDto<?> checkUsernameForJoin(String username) {
        if (username.equals("") || username == null) {
            return new ResponseDto<>(-1, "올바른 유저네임을 입력하세요", false);
        }
        User user = userRepository.findByUsername(username);
        if (user == null) {
            return new ResponseDto<>(1, "중복된 유저네임이 없습니다", true);
        } else {
            return new ResponseDto<>(1, "유저네임이 중복됩니다.", true);
        }

    }
}
