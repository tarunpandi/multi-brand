---
sidebar_position: 4
---

# FAQ

<details>
<summary>Can we create blocks, themes and brand artifcats manually?</summary>

Yes, blocks, If you prefer to create artifacts manually, follow the structure shown in the sections below,
- [Theme Generator Examples](/docs/theme-management#manual-theme-creation)
- [Brand Generator Examples](/docs/brand-management#manual-brand-creation)
- [Block Generator Examples](/docs/blocks-components#manual-block-creation)

</details>

<details>
<summary>Theme server won't start</summary>

- Check if port 3000 is already in use
- Verify Node.js version (18+ required)
- Try running `npm run clean` to clear any crash logs
- Check the console for specific error messages

</details>

<details>
<summary>CSS not updating in browser</summary>

- Ensure the theme server is running
- Check browser developer tools for CSS loading errors
- Verify file paths and naming conventions
- Try hard refresh (Ctrl+F5 or Cmd+Shift+R)

</details>

<details>
<summary>Block not appearing on page</summary>

- Check if the block is properly registered in AEM
- Verify the block's CSS and JS files are being loaded
- Check browser console for JavaScript errors
- Ensure the block configuration is correct

</details>

<details>
<summary>Build process fails</summary>

- Check for syntax errors in CSS or JavaScript files
- Verify all required files exist
- Try running `npm run clean` before rebuilding
- Check Node.js version compatibility

</details> 