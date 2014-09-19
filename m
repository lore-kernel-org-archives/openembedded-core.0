Return-Path: <Fahad_Usman@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 16FAC70EF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 06:25:55 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XUrdk-0002s8-44 from Fahad_Usman@mentor.com ;
	Thu, 18 Sep 2014 23:25:56 -0700
Received: from [137.202.156.82] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 19 Sep 2014 07:25:54 +0100
Message-ID: <541BCC6B.4030804@mentor.com>
Date: Fri, 19 Sep 2014 11:25:47 +0500
From: "Usman, Fahad" <Fahad_Usman@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: ChenQi <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1411099563-29139-1-git-send-email-fahad.usman@gmail.com>
	<541BB61B.7070905@windriver.com>
In-Reply-To: <541BB61B.7070905@windriver.com>
X-Originating-IP: [137.202.0.76]
Subject: Re: [PATCH] sysklogd: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 19 Sep 2014 06:26:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2014 09:50 AM, ChenQi wrote:
> I'm now adding systemd support for sysklogd.
> This recipe will then inherit systemd.bbclass.
> And the task of setting INHIBIT_UPDATERCD_BBCLASS is automatically done.
>
> The patches will be sent out in one day or two.
>
> Best Regards,
> Chen Qi 
Okay, thanks Chen Qi

Regards,
Fahad Usman

