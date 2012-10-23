Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TQgWh-0005V1-BH
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 17:36:19 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TQgJj-00026Z-6F; Tue, 23 Oct 2012 17:22:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Tue, 23 Oct 2012 16:22:53 +0100
In-Reply-To: <CAOHjBZtTso5LuxjUX=Y+z7UNwnBLKo2rsYRs1oOyMeNfc5oTJg@mail.gmail.com>
References: <CAOHjBZtTso5LuxjUX=Y+z7UNwnBLKo2rsYRs1oOyMeNfc5oTJg@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351005775.3259.350.camel@phil-desktop>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: add init applet to busybox
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
X-List-Received-Date: Tue, 23 Oct 2012 15:36:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-23 at 17:22 +0200, Giuseppe Condorelli wrote:
> I need to enable init applet in the current version of busybox.
> Do I have to create my own defconfig to pass via .bbappend file 

That's probably the best approach, yes.

p.





