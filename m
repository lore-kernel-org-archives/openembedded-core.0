Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1SoN92-0006uk-PV
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 01:13:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id B87FF13817A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 17:02:19 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id nFPiPPPRuC2H
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 17:02:15 -0600 (MDT)
Received: from [172.20.202.96] (unknown [172.20.202.96])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 4301E13815B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 17:02:15 -0600 (MDT)
Message-ID: <4FFB6344.80708@se-eng.com>
Date: Mon, 09 Jul 2012 17:03:32 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1341867108-7823-1-git-send-email-ray.danks@se-eng.com>
	<CAMKF1sqpZtYyb4qCjFJu1Scb_J3KsvoX+UXkWC57bS_KgwAKOw@mail.gmail.com>
In-Reply-To: <CAMKF1sqpZtYyb4qCjFJu1Scb_J3KsvoX+UXkWC57bS_KgwAKOw@mail.gmail.com>
Subject: Re: [PATCH] mkelfimage: Upgrade to e1e6a91
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ray.danks@se-eng.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 09 Jul 2012 23:13:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 04:41 PM, Khem Raj wrote:
> On Mon, Jul 9, 2012 at 1:51 PM, Raymond Danks<ray.danks@se-eng.com>  wrote:
>> Packaging issues resolved with latest version from git.
> which packaging issues ? can you add more context here please.
Raj,

This is in response to Saul's make world test on x86 from last night.  
See the thread entitled [PATCH 2/2] mkelfimage: Add stable git build 
(initial recipe).

The patch merged into to coreboot is here:
http://review.coreboot.org/#/c/1195/

This patch is the same revision as the revision specified in the .bb file.

Thanks,
Ray

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



