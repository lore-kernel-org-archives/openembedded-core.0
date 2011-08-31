Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QylD1-00034Y-DV
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 15:52:03 +0200
Received: by wwe32 with SMTP id 32so636557wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 06:47:09 -0700 (PDT)
Received: by 10.227.116.77 with SMTP id l13mr251629wbq.62.1314798428791;
	Wed, 31 Aug 2011 06:47:08 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 11sm5492039wbw.43.2011.08.31.06.47.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Aug 2011 06:47:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314696364.19905.107.camel@phil-desktop>
Date: Wed, 31 Aug 2011 15:47:04 +0200
Message-Id: <B7455BF7-F33E-4369-B812-9B9864E14E47@dominion.thruhere.net>
References: <1314210721-29941-1-git-send-email-koen@dominion.thruhere.net>
	<1314264296.19905.29.camel@phil-desktop>
	<1314284316.5939.196.camel@rex>
	<1314367938.19905.90.camel@phil-desktop>
	<EB5E7A93-679D-4108-8E6D-03D7E1865908@dominion.thruhere.net>
	<1314372632.19905.93.camel@phil-desktop>
	<C368959C-3433-4A60-8B2E-65AC7FBF341E@dominion.thruhere.net>
	<1314696364.19905.107.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/2] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Wed, 31 Aug 2011 13:52:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 30 aug. 2011, om 11:26 heeft Phil Blundell het volgende geschreven:

> On Fri, 2011-08-26 at 18:31 +0200, Koen Kooi wrote:
>> That one doesn't seem to apply:
> 
> Hm, yes, it seems I somehow damaged the patch in my last mail.  Third
> time lucky then.

That seems to fix it, thanks


