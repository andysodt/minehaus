class AllResources extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			resources: []
		};
	}
	componentDidMount() {
		fetch('/api/v1/resources.json')
			.then((response) => { return response.json() })
			.then((data) => { this.setState({ resources: data }) });
	}
	render() {
		var resources = this.state.resources.map((resource) => {
			return (
				<div key={resource.id}>
					<h1>{resource.title}</h1>
					<p>{resource.description}</p>
					<p>{resource.url}</p>
				</div>
			)
		})
		return (
			<div>
				{resources}
			</div>
		)
	}
}