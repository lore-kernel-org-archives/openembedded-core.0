Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18zpF4bor/o/vCA58IP4muy8kgr9zBbLzE=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmRRI-0001Mp-2d
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 16:19:52 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SEFXQj028483
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 09:15:34 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Thu, 28 Jul 2011 09:15:34 -0500
Message-Id: <A64E29D1-A803-4CC3-B7D7-C82C915869D0@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: lib vs lib64?
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
X-List-Received-Date: Thu, 28 Jul 2011 14:19:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

With recent multilib changes for a pure 64-bit target (no multilib) =
should things be in /lib or /lib64?

- k=


