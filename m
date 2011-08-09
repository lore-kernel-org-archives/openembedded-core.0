Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/9UYqlC4M6opUShD3cEI2p9giBcO07Vwk=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqmlR-0007Yy-HV
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 15:54:37 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p79Do8FI014201
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 08:50:09 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Tue, 9 Aug 2011 08:50:08 -0500
Message-Id: <CBFDDB2B-BFE3-43CD-A124-253BBBC40898@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: multiple providers message?
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
X-List-Received-Date: Tue, 09 Aug 2011 13:54:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

When trying to build meta-toolchain-sdk I'm seeing (is this ok or needs =
some fixing):

NOTE: multiple providers are available for runtime libsqlite3-dev =
(sqlite3, sqlite3-nativesdk)
NOTE: consider defining a PREFERRED_PROVIDER entry to match =
libsqlite3-dev

- k=


