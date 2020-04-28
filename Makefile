PACKAGE := ghn-${TAG}.tar.gz

${PACKAGE}:
ifndef TAG
	$(error Please specify TAG)
endif
	tar czf $@ bin libexec LICENSE

package: ${PACKAGE}
.PHONY: package

release: ${PACKAGE}
	hub release create --draft --edit --attach "${PACKAGE}" "${TAG}"
.PHONY: release
