Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QOt32-0004f8-35 for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 16:57:28 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QOt08-0002Rq-So; Tue, 24 May 2011 16:54:29 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <D0F7BA36-2C4C-4442-851F-EC89894864F4@gmail.com>
References: <cover.1306037150.git.raj.khem@gmail.com>
	<c3ce108a01c4c250640528973e4cf12dfe062671.1306037150.git.raj.khem@gmail.com>
	<4DDBC45A.6090102@intel.com>
	<D0F7BA36-2C4C-4442-851F-EC89894864F4@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 24 May 2011 15:54:27 +0100
Message-ID: <1306248867.2525.198.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 1/1] eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
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
X-List-Received-Date: Tue, 24 May 2011 14:57:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-24 at 07:52 -0700, Khem Raj wrote:
> I have done couple of builds of eglibc with -j 2

Do you really mean that?  I wonder if you actually tested with -j2
instead.

p.



