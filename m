Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZoPy-0003XS-T4
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 20:14:18 +0200
Received: by wyb34 with SMTP id 34so1655318wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:10:43 -0700 (PDT)
Received: by 10.216.229.165 with SMTP id h37mr3445855weq.69.1308852642570;
	Thu, 23 Jun 2011 11:10:42 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o75sm995480weq.40.2011.06.23.11.10.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 11:10:41 -0700 (PDT)
Message-Id: <BC4DC62A-53A4-4496-AC31-EE777658237E@dominion.thruhere.net>
From: Koen Kooi <koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9ed3e2720577e745d39712ed901b39bfe1aed6c2.1308852888.git.mark.hatle@windriver.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Thu, 23 Jun 2011 20:10:30 +0200
References: <cover.1308852888.git.mark.hatle@windriver.com>
	<9ed3e2720577e745d39712ed901b39bfe1aed6c2.1308852888.git.mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.936)
Subject: Re: [PATCH 5/9] libtirpc: Fix owner/group of /etc/netconfig
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
X-List-Received-Date: Thu, 23 Jun 2011 18:14:19 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 23 jun 2011, om 20:19 heeft Mark Hatle het volgende geschreven:

> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb |    6 +++++-

Not related to this patch, but 0.2.2 is out and we'll need some more  
updates for (e)glibc 2.14


