Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TaaPs-0001iH-Vw
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 00:06:13 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TaaCK-00007J-0S; Mon, 19 Nov 2012 23:52:12 +0100
Message-ID: <1353365526.11617.16.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Mon, 19 Nov 2012 22:52:06 +0000
In-Reply-To: <1353351129-7108-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1353351129-7108-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] strace: backport AArch64 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 23:06:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-11-19 at 19:52 +0100, Marcin Juszkiewicz wrote:
> @@ -1,11 +1,10 @@
> -Upstream-Status: Backport
> +Upstream-status: Backport

Why did you make that change?  "Upstream-Status" is the canonical
spelling.

p.




