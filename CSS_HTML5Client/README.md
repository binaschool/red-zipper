# CSS_HTML5_CLient

This folder provides a quick way to overwrite CSS definitions in the Bina BBB HTML5 client.

In the /src directory is a file main.css that is appended to the Bina HTML5 client at the end of the page load, so it has prescidence over everything except inline styles.

To edit the CSS and add or remove definitions, you need to first run :

```
npm install
```

Then after making your changes to the CSS file you need to run :

```
npm start
```

This will lint and verify your css file for errors and create an optimized version using POSTCSS. If the file passes the linting the generated file will overwrite the bina.css file in this directory. The bina.css file is the final artifact.

After this process is complete, you need to commit and push your changes into the github master trunk branch. The trunk branch is automatically published into a gh-pages repo, where the css file is accessed by the Bina BBB HTML5 Client under here :

https://binaschool.github.io/red-zipper/CSS_HTML5Client/bina.css