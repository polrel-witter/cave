^~
'''
* { margin: 0; padding: 0; }
:root {
  --red: #ff4d4d;
}
html, body {
  font-family: Urbit Sans, Arial;
  font-size: 1.25rem;
  font-weight: 700;
  color: blue;
  background: var(--red);
  max-width: 330;
  margin: auto;
}
nav {
  position: relative;
  display: flex;
  justify-content: center;
  gap: 20px;
  padding-top: 20px;
}
a {
  color: blue;
  padding-top: 2px;
}
a:hover {
  color: white;
  text-decoration-line: overline;
}
button:hover {
  text-decoration-line: overline;
}
button {
  font-family: Urbit Sans, Arial;
  font-size: 1.25rem;
  font-weight: 700;
  color: blue;
  background: var(--red);
  border-color: var(--red);
  border-style: solid;
  cursor: pointer;
  text-decoration-line: underline;
  transition: filter 100ms ease;
}
#wall {
  display: flex;
  flex-flow: row wrap;
  padding-top: 20px;
}
.stone {
  width: 20px;
  height: 28px;
  padding: 1px;
  text-align: center;
}
input {
  display: block;
  font-family: Urbit Sans, Arial;
  font-size: 1.25rem;
  font-weight: 700;
  color: white;
  background: var(--red);
  border-color: var(--red);
  border-style: solid;
  width: 20px;
  height: 28px;
}
@font-face {
  font-family:Urbit Sans;
  src:url(https://assembly.urbit.org/_next/static/media/UrbitSans-Light.07739c1a.otf);
  font-weight:300;
  font-style:normal
}
@font-face {
  font-family:Urbit Sans;
  src:url(https://assembly.urbit.org/_next/static/media/UrbitSans-Regular.108abb2f.otf);
  font-weight:400;
  font-style:normal
}
@font-face {
  font-family:Urbit Sans;
  src:url(https://assembly.urbit.org/_next/static/media/UrbitSans-Medium.a5a9ec11.otf);
  font-weight:500;
  font-style:normal
}
'''
