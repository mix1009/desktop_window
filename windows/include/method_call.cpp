#include "method_call.h"
#include "borders.h"

namespace DesktopWindowMethodCall
{
    MethodCall::MethodCall(const flutter::MethodCall<flutter::EncodableValue> &Cmethod_call,
                           std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> Cresult): method_call(Cmethod_call)
    {
        result = std::move(Cresult);
    }

    void MethodCall::setFullscreen()
    {
        const auto *arguments = std::get_if<flutter::EncodableMap>(method_call.arguments());
        bool fullscreen = false;
        if (arguments)
        {
            auto fs_it = arguments->find(flutter::EncodableValue("fullscreen"));
            if (fs_it != arguments->end())
            {
                fullscreen = std::get<bool>(fs_it->second);
            }
        }
        HWND handle = GetActiveWindow();

        WINDOWPLACEMENT placement;

        GetWindowPlacement(handle, &placement);

        if (fullscreen)
        {
            placement.showCmd = SW_MAXIMIZE;
            SetWindowPlacement(handle, &placement);
        }
        else
        {
            placement.showCmd = SW_NORMAL;
            SetWindowPlacement(handle, &placement);
        }

        result->Success(flutter::EncodableValue(true));
    }

    void MethodCall::getFullscreen()
    {
        HWND handle = GetActiveWindow();

        WINDOWPLACEMENT placement;
        GetWindowPlacement(handle, &placement);

        result->Success(flutter::EncodableValue(placement.showCmd == SW_MAXIMIZE));
    }

    void MethodCall::toggleFullscreen()
    {
        HWND handle = GetActiveWindow();

        WINDOWPLACEMENT placement;
        GetWindowPlacement(handle, &placement);

        if (placement.showCmd == SW_MAXIMIZE)
        {
            placement.showCmd = SW_NORMAL;
            SetWindowPlacement(handle, &placement);
        }
        else
        {
            placement.showCmd = SW_MAXIMIZE;
            SetWindowPlacement(handle, &placement);
        }
        result->Success(flutter::EncodableValue(true));
    }

    void MethodCall::setBorders()
    {
        const auto *arguments = std::get_if<flutter::EncodableMap>(method_call.arguments());
        bool border = false;
        if (arguments)
        {
            auto fs_it = arguments->find(flutter::EncodableValue("border"));
            if (fs_it != arguments->end())
            {
                border = std::get<bool>(fs_it->second);
            }
        }

        HWND hWnd = GetActiveWindow();

        Borders::setBorders(&hWnd, border, true);

        result->Success(flutter::EncodableValue(true));
    }

    void MethodCall::hasBorders()
    {
        HWND hWnd = GetActiveWindow();
        result->Success(flutter::EncodableValue(Borders::hasBorders(&hWnd)));
    }

    void MethodCall::toggleBorders()
    {
        HWND hWnd = GetActiveWindow();
        Borders::toggleBorders(&hWnd, true);

        result->Success(flutter::EncodableValue(true));
    }

    void MethodCall::stayOnTop()
    {
        const auto *arguments = std::get_if<flutter::EncodableMap>(method_call.arguments());
        bool stayOnTop = false;
        if (arguments)
        {
            auto fs_it = arguments->find(flutter::EncodableValue("stayOnTop"));
            if (fs_it != arguments->end())
            {
                stayOnTop = std::get<bool>(fs_it->second);
            }
        }

        HWND hWnd = GetActiveWindow();

        RECT rect;
        GetWindowRect(hWnd, &rect);
        SetWindowPos(hWnd, stayOnTop? HWND_TOPMOST: HWND_NOTOPMOST, rect.left, rect.top, rect.right-rect.left, rect.bottom -rect.top, SWP_SHOWWINDOW);
        
        result->Success(flutter::EncodableValue(true));
    }

  
    void MethodCall::focus()
    {
        HWND hWnd = GetActiveWindow();
        SetFocus(hWnd);

        result->Success(flutter::EncodableValue(true));
    }

}
