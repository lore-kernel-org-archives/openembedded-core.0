Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QwW9a-00045w-6Q
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 11:23:14 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QwW4z-0006y0-40
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 11:18:29 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 10:18:27 +0100
In-Reply-To: <CABcZAN=mt6HCmtMnX+P4-BAOkQwZZ3uCS_sT+uutziBu0VYv9w@mail.gmail.com>
References: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
	<CABcZAN=mt6HCmtMnX+P4-BAOkQwZZ3uCS_sT+uutziBu0VYv9w@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314263909.19905.25.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
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
X-List-Received-Date: Thu, 25 Aug 2011 09:23:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-19 at 15:11 -0700, Chris Larson wrote:
> But then, there's a tendency nowadays to avoid map/filter/etc, 
> so that's probably not best :)

Oh, is there?  What's the objection to those constructs, out of
interest?  I am quite fond of them myself.

p.




