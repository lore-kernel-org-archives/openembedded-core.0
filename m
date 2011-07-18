Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QivFM-0006gM-6W
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 23:21:00 +0200
Received: (qmail invoked by alias); 18 Jul 2011 21:16:55 -0000
Received: from p5B0A326A.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.50.106]
	by mail.gmx.net (mp012) with SMTP; 18 Jul 2011 23:16:55 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+g8cpBkmKgyVH9WTSjGcJK4X6s0q7QncPZtY6zFn
	9D5NybA7dsF27f
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jul 2011 23:19:01 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <201107182310.56104.schnitzeltony@gmx.de>
In-Reply-To: <201107182310.56104.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201107182319.01358.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Problems downloading xfwm4 4.8.1
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
X-List-Received-Date: Mon, 18 Jul 2011 21:21:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit

On Monday, July 18, 2011 11:10:55 PM you wrote:
> Ciao
> 
> currently I am porting my local oe recipes for xfce-4.8 to oe-core.
> Everything seems fine so far - except xfwm4. This one drives me totally
> insane: If you check the fetch log attched and copy the first url into a
> browser it starts downloading without problems but oe complains.
> 
> Could somebody please point me onto what is going wrong - if you need
> further information I'll send...
> 
I found a hook on what is going wrong - forget my prevoius mail - sorry fo the 
noise..

Andreas


