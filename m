Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QW352-0005fR-DR
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 11:05:08 +0200
Received: by wwb17 with SMTP id 17so3846090wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 02:01:44 -0700 (PDT)
Received: by 10.216.81.203 with SMTP id m53mr2594656wee.9.1307955704235;
	Mon, 13 Jun 2011 02:01:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id en1sm4081807wbb.1.2011.06.13.02.01.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 02:01:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307955075.6879.11.camel@lenovo.internal.reciva.com>
Date: Mon, 13 Jun 2011 11:01:42 +0200
Message-Id: <270A8BB0-8854-478A-819E-394CDE0E3443@dominion.thruhere.net>
References: <cover.1307937636.git.raj.khem@gmail.com>
	<1307955075.6879.11.camel@lenovo.internal.reciva.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/1] Upgrade gcc 4.6.0 to latest on FSF 4.6 branch
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
X-List-Received-Date: Mon, 13 Jun 2011 09:05:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 13 jun 2011, om 10:51 heeft Phil Blundell het volgende geschreven:

> On Sun, 2011-06-12 at 21:03 -0700, Khem Raj wrote:
>> This patch brings in new patches from gcc 4.6 FSF branch
>> And refreshes the headers of existing backported patches
>> to not have git patch numbers in comments
>> 
>> I am not sending the patch itself to mailing list due to its
>> large size so please review it on the contrib tree itself
>> 
> 
> Would we not be better off just pulling the tip of the 4.6 branch from
> FSF SVN, rather than having to keep all these patches in git?

We used the svn approach with gcc 4.5 and I liked it very, very much.

regards,

Koen


