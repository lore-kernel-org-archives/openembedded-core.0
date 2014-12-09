Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id BDE0872512
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 11:11:54 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id a41so149013yho.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 03:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=pFOCj1bU7A9sJ1T7/fLlb8BwPF6GKlMEQozm1VUYY9E=;
	b=R7UpexDnX+iiqmoy2BK4EVT8msSNqsw4M3ifiVy2BcumVA4Y6WlSLjFQ9vFx8e9e5k
	oD4dAz5Y1N1oJC758JeNeVA31og9n5TsCql/Z0QGCP/LcnncFTwtnnk+QzUeNAXTqYPK
	Of6oK+0giaqIpCuNjgSHvL1NAL9Ps/cxayqyk+GCSrLC/MUPX9VfSM/vWD/Utd2HjNXR
	vfClz0KoW3iUgjbSYJ9UGRR4sX3KERiDhV1JxosQ2R2b4FLM/zs47wm2Qd3Fo8YylESG
	sw//h1/lEIBzpgC6yLPLJDGHV/aMgX9yxsfq76OphnreN0JX6rgWBtSGse9aMLcxcvzu
	CwhA==
MIME-Version: 1.0
X-Received: by 10.236.109.166 with SMTP id s26mr2015957yhg.67.1418123514493;
	Tue, 09 Dec 2014 03:11:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Tue, 9 Dec 2014 03:11:53 -0800 (PST)
In-Reply-To: <20141209110206.GB8523@piout.net>
References: <1415959113-8920-1-git-send-email-diego.sueiro@gmail.com>
	<CAP9ODKrscVSj=kdrXvCSmULQqttdyfEq6pKjhJhg+3e7GkXAaQ@mail.gmail.com>
	<CAMCfZKENk_=z7CETjEB+DkBpeTzpPnYfsr3BdAZzBt6zvsy1Lw@mail.gmail.com>
	<CAP9ODKoqP3s1bnJYTQpkzWTOCUcCUTs5iRZxd-cjtQwpu2oHtw@mail.gmail.com>
	<20141209110206.GB8523@piout.net>
Date: Tue, 9 Dec 2014 09:11:53 -0200
X-Google-Sender-Auth: 5EZQ7qpMcO4M0J-k1qmWhk5byhc
Message-ID: <CAP9ODKq7my6PKW+z0Aekg_81k-uetcXhOZtF1VK2Rx4nYsnMYg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtsystems: Change branch from stable to 5.3
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
X-List-Received-Date: Tue, 09 Dec 2014 11:11:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 9, 2014 at 9:02 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> On 14/11/2014 at 08:52:35 -0200, Otavio Salvador wrote :
>> No problem; I applied it for dizzy and master branches.
>>
>
> Is daisy still maintained? If yes, it is necessary to apply it on daisy
> too.

Yes it is.

Pushed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

