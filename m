Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RzSDc-0005zW-Bm
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Feb 2012 13:19:48 +0100
Received: by werc1 with SMTP id c1so3298541wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2012 04:11:30 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.78.233 as permitted sender)
	client-ip=10.180.78.233; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.78.233 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.78.233])
	by 10.180.78.233 with SMTP id e9mr17776255wix.0.1329739890791 (num_hops
	= 1); Mon, 20 Feb 2012 04:11:30 -0800 (PST)
Received: by 10.180.78.233 with SMTP id e9mr14865610wix.0.1329739890732;
	Mon, 20 Feb 2012 04:11:30 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y6sm15316106wix.10.2012.02.20.04.11.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Feb 2012 04:11:29 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F31F617.9020603@linux.intel.com>
Date: Mon, 20 Feb 2012 13:11:27 +0100
Message-Id: <A86092D2-EFD8-4D6E-93A6-7911E3A9B066@dominion.thruhere.net>
References: <cover.1328510187.git.raj.khem@gmail.com>
	<4F31F617.9020603@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnjNOK3bDScnBUnc7vXzwLDaGCUDtC82324gDdsXG3VIJ3+WYb8FLb+f1mZnEkwQpyACidY
Subject: Re: [PATCH V2 00/20] uclibc upgrade, initial kmod and thumb tune
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
X-List-Received-Date: Mon, 20 Feb 2012 12:19:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 8 feb. 2012, om 05:12 heeft Saul Wold het volgende geschreven:

> On 02/05/2012 10:40 PM, Khem Raj wrote:
>> 
> 
>>   kmod: Add recipes
>>   module-init-tools: Delete
>>   image.bbclass,kernel.bbclass: Use kmod-native instead of
>>     module-init-tools-cross
> Withdrawn for now

Khem, Saul, any news on a new patchset for kmod? 

regards,

Koen


