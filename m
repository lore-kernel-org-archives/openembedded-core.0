Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjWBi-0000f0-5b
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 14:47:42 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjW7m-0003Ak-5T
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 14:43:38 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2011 13:43:37 +0100
In-Reply-To: <611DBEB9-A901-4A01-AEB0-EAC2724FBED1@kernel.crashing.org>
References: <611DBEB9-A901-4A01-AEB0-EAC2724FBED1@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311165818.30326.67.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: lzo build failure
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
X-List-Received-Date: Wed, 20 Jul 2011 12:47:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 07:31 -0500, Kumar Gala wrote:
> I'm trying to build lzo for a powerpc64 target and I'm getting:
> 
> configure: 
> configure: Your compiler failed the ACC conformance test - for details see 
> configure: `config.log'. Please check that log file and consider sending
> configure: a patch or bug-report to <markus@oberhumer.com>.
> configure: Thanks for your support.
> configure: 
> configure: error: ACC conformance test failed. Stop.

Did you check config.log as it suggests?  If yes, what did you find
there?

p.




