Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RMPrd-0004Pk-1P; Fri, 04 Nov 2011 20:55:45 +0100
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RMPld-00026c-68; Fri, 04 Nov 2011 15:49:33 -0400
Date: Fri, 04 Nov 2011 15:49:33 -0400
Message-Id: <E1RMPld-00026c-68@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-10-24 to 2011-10-31
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2011 19:55:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-10-24 to 2011-10-31.  Projects included in this report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://git.angstrom-distribution.org/meta-angstrom
meta-yocto: git://git.yoctoproject.org/poky
meta-texasinstruments: =
git://git.angstrom-distribution.org/meta-texasinstruments
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-micro: git://git.openembedded.org/meta-micro
meta-slugos: git://github.com/kraj/meta-slugos
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-intel: git://git.yoctoproject.org/meta-intel
meta-handheld: git://git.openembedded.org/meta-handheld
meta-opie: git://git.openembedded.org/meta-opie
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Christopher Larson (1):
=20=20codeparser: make var_expands actually hold useful information

Cliff Brake (1):
=20=20Linefeed to test commits

Richard Purdie (1):

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Joshua Lock (3):
=20=20libxslt: Fix packaging of xsltConf.sh
=20=20libcanberra: add new package for unpackaged files
=20=20clutter-gtk: add LIC_FILES_CHKSUM to include file

Julian Pidancet (1):
=20=20Give coreutils a chance to build the df utility

Martin Jansa (5):
=20=20libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-native, git: =
bump PR=20
=20=20python: update generate-manifest for 2.7 version and regenerate it
=20=20python-2.7.2: fix build issues when additional modules are linked =
against ho
=20=20recipes: bump PR after python upgrade
=20=20python-dir: change PYTHON_BASEVERSION to 2.7

Matthew McClintock (2):
=20=20Add new util-linux-chkdupexe package to avoid making perl a dependecy =
for al
=20=20Add readline as dependecy for gdb-cross-canadian

Nitin A Kamble (2):
=20=20python, python-native: upgrade from 2.6.6 to 2.7.2
=20=20update python 2.7 manifest

Scott Garman (4):
=20=20sudo: upgrade to 1.8.3
=20=20grep: upgrade to 2.9
=20=20mtools: upgrade to 4.0.17
=20=20openssh: upgrade to 5.9p1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (9):
=20=20xfce.bbclass: Move static libraries to ${PN}-staticdev
=20=20xfce-panel-plugin.bbclass: pack modules also from =
${libdir}/xfce4/panel-plug
=20=20xfce4-datetime-plugin: Initial add git (0.6.1)
=20=20xfce-utils: update to 4.8.3
=20=20xfce-app.bbclass: just set SRC_URI commmon to most xfce-apps
=20=20ristretto: update to 0.2.2
=20=20xfce4-eyes-plugin: initial add 4.4.1
=20=20xfce4-weather-plugin: initial add 0.7.4
=20=20evince: initial add 2.32.0

Imran Mehmood (1):
=20=20xclock: Add version 1.0.5 (initial recipe)

Joel A Fernandes (1):
=20=20memtester: Corrected recipe following review comments and guidelines

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (2):
=20=20angstrom-uboot-scripts: adjust for oe-core
=20=20angstrom core tweaks: whitelist SOC_FAMILY for shared state =
dependency track

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Julian Pidancet (1):
=20=20Give coreutils a chance to build the df utility

Martin Jansa (1):
=20=20libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-native, git: =
bump PR=20

Matthew McClintock (2):
=20=20Add new util-linux-chkdupexe package to avoid making perl a dependecy =
for al
=20=20Add readline as dependecy for gdb-cross-canadian

Scott Garman (4):
=20=20sudo: upgrade to 1.8.3
=20=20grep: upgrade to 2.9
=20=20mtools: upgrade to 4.0.17
=20=20openssh: upgrade to 5.9p1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Denys Dmytriyenko (3):
=20=20linux-ti33x-psp: update defconfigs for am335x-evm
=20=20README: cleanup, mostly typo and long-line fixing
=20=20linux-ti33x-psp: rebase for 3.1 release

Jason Kridner (1):
=20=20sdcard_image: align partitions with flash pages

Joel A Fernandes (2):
=20=20linux-ti33x-psp 3.1rc8: Enable usb-to-serial drivers
=20=20beaglebone-tester: Update to latest, bump PR

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis 'GNUtoo' Carikli (4):
=20=20meta-shr: shr-e-gadgets: fix SHR bug #1490
=20=20meta-shr: intone: fix LICENSE and add LIC_FILES_CHKSUM
=20=20meta-samsung: crespo: add SERIAL_CONSOLE
=20=20meta-shr: shr-e-gadgets: fix tasklist window proliferation

Klaus Kurzmann (7):
=20=20libsamsung-ipc_git: bump SRCREV
=20=20cornucopia.inc: bump FSO_CORNUCOPIA_SRCREV
=20=20shr-e-gadgets_git: bump SRCREV
=20=20ffphonelog_git: add patch to adjust to elm api changes
=20=20add u-boot for the om-gta04
=20=20ffalarms_git.bb: bump SRCREV for libeflvala changes
=20=20iliwi_git: fix for renamed vapi and changed API

Martin Jansa (7):
=20=20openssh: rename bbappend to match new version
=20=20meta-openmoko: linux-2.6.39: enable BQ27x00 module and platform =
battery as m
=20=20meta-smartphone: linux.inc: change KEEP_OABI default to disabled
=20=20emtooth2: bump SRCREV
=20=20Revert "meta-openmoko: linux-2.6.39: enable BQ27x00 module and =
platform batt
=20=20recipes: bump PR after python upgrade
=20=20recipes: bump PR after python upgrade

Simon Busch (3):
=20=20meta-shr: connman: ignore ifb0/ifb1 devices for configuration too and =
bump P
=20=20meta-fso: cornucopia: bump SRCREV
=20=20meta-fso: libsamsung-ipc: bump SRCREV

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Kishore Bodke (1):
=20=20New Romley BSP created. Uses Matrox MGA graphics driver.

Tom Zanussi (7):
=20=20meta-crownbay: README correction
=20=20meta-fri2: README correction
=20=20meta-crownbay: add linux-yocto-rt_3.0.bbappend
=20=20meta-fri2: allow linux-yocto-rt to be used for fri2-noemgd
=20=20meta-crownbay: allow linux-yocto-rt to be used for crownbay
=20=20meta-romley: Fix BSP description in romley.conf
=20=20meta-romley: change references to sugarbay in =
linux-yocto-rt_3.0.bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Chase Maupin (1):
=20=20sourceipk: dereference symlinks in sourceipk

Marco Cavallini (3):
=20=20kaeilos-2011-preferred-versions.inc: added new preferences
=20=20kaeilos.conf: updated KaeilOS version
=20=20kaeilos.conf: updated KaeilOS version

Mats K=C3=A4rrman (1):
=20=20binutils_2.18: update SRC_URI to avoid manual delete

Paul Menzel (3):
=20=20id3lib: Correct `LICENSE` to `LGPLv2+` [1][2]
=20=20id3lib: Order header fields according to style guide [1]
=20=20id3lib: Add `HOMEPAGE =3D "http://id3lib.sourceforge.net/"`     =
Signed-off-by:

Ulf Samuelsson (1):
=20=20binutils-2.20.1: Change source package to binutils-2.20.1a




