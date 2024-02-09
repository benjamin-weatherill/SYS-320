// JS Header insert

class Header extends HTMLElement {
	constructor() {
		super();
	}
	
	connectedCallback() {
		this.innerHTML = `
			<style>
			/* Style the header (same as before) */
			header {
				background-color: #333;
				color: #fff;
				padding: 10px;
			}

			nav ul {
				list-style-type: none;
				padding: 0;
				text-align: center;
			}

			nav ul li {
				display: inline;
				margin: 0 10px;
			}

			nav ul li a {
				text-decoration: none;
				color: #fff;
				font-weight: bold;
			}
			</style>
			<header>
				<nav>
					<ul>
						<li><a href="index.html">Main Page</a></li>
						<li><a href="page1.html">Page1</a></li>
						<li><a href="page2.html">Page2</a></li>
						<li><a href="page3.html">Page3</a></li>
					</ul>
				</nav>
			</header>
		`;
	}
}

customElements.define('header-component', Header);
