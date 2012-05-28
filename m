Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SYwfB-0002Mk-2j
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 11:54:57 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SYwVH-0002ff-5i
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 11:44:43 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 28 May 2012 10:44:42 +0100
In-Reply-To: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
References: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1338198283.1964.320.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] Support additional user-defined package metadata
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
X-List-Received-Date: Mon, 28 May 2012 09:54:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-05-13 at 16:28 +0300, Leonid Borisenko wrote:
> Custom metadata field with supported firmware version(s) could be
> included into package control file for preventing of installing packaged
> modifications onto unsupported firmware.

Why isn't RDEPENDS sufficient for this?

p.




