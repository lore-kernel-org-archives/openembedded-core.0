Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Sz5Wz-00037d-Em
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 14:38:33 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Sz5Lc-0006Ps-J8
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 14:26:48 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Aug 2012 13:26:47 +0100
In-Reply-To: <CAJTo0Laqeyr4AeKdZ5Fw5BQiDGdZPJNcm8VZZvWR9ZqjbjnaUw@mail.gmail.com>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<1344422390.23275.233.camel@phil-desktop>
	<CAJTo0Laqeyr4AeKdZ5Fw5BQiDGdZPJNcm8VZZvWR9ZqjbjnaUw@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1344428808.23275.244.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 12:38:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-08 at 13:07 +0100, Burton, Ross wrote:
> it's pretty tough these days to deny that a competent
> web browser/HTML app engine is becoming an important feature as many
> appliances are moving to HTML/JS instead of other languages (kiosks,
> STBs, etc).

Yes, I agree, and that's one reason that I think having WebKit in
oe-core proper (rather than relegated to part of the testsuite) would
make sense.

If WebKit did go into oe-core then I agree that using some sort of
WebKit-based browser (which might well be Midori) as part of the test
harness would be an entirely reasonable thing to do.

p.




