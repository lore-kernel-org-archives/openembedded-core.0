Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 40FE760EE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 13:09:28 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VN0Sf-0003NX-NN from Muhammad_Shakeel@mentor.com ;
	Fri, 20 Sep 2013 06:09:29 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 20 Sep 2013 06:09:29 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Fri, 20 Sep 2013 14:09:27 +0100
Message-ID: <523C495F.2070105@mentor.com>
Date: Fri, 20 Sep 2013 18:10:55 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
References: <1379595133-5812-1-git-send-email-muhammad_shakeel@mentor.com>
	<1379596189.18603.115.camel@ted> <523AF9CB.5040600@mentor.com>
	<523AFF14.10400@linux.intel.com>
In-Reply-To: <523AFF14.10400@linux.intel.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 20 Sep 2013 13:09:29.0866 (UTC)
	FILETIME=[A40A6EA0:01CEB602]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: Upgrade to v1.18
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Sep 2013 13:09:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2013 06:41 PM, Jukka Rissanen wrote:
>
> I would recommend taking it. Biggest issue fixed in 1.18 was the 
> iptables support which did not work in ARM based devices.
>
>
> This patch could perhaps split to two pieces, first one removing 
> obsolete options and second one updating the version.
>
Ok, I will resend this after splitting it into two commits.

Thanks,


