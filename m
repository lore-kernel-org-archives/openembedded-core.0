Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5E79761FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 12:26:33 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0FCPwkU027295; Wed, 15 Jan 2014 12:26:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zaJBi-CHaDLL; Wed, 15 Jan 2014 12:26:27 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0FCQOxL027390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 15 Jan 2014 12:26:25 GMT
Message-ID: <1389788778.14987.75.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 15 Jan 2014 12:26:18 +0000
In-Reply-To: <CAP9ODKqs2ipsdVzx=bTVR8KcAQxYCbEX7BpwWCx7CFtcBs3GRw@mail.gmail.com>
References: <cover.1389765320.git.bruce.ashfield@windriver.com>
	<b58ba1cebca8be200a6c438b6a146ae4100c2c4e.1389765320.git.bruce.ashfield@windriver.com>
	<CAP9ODKqs2ipsdVzx=bTVR8KcAQxYCbEX7BpwWCx7CFtcBs3GRw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] linux-yocto/3.10: mohonpeak bsp config and scc files
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
X-List-Received-Date: Wed, 15 Jan 2014 12:26:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-15 at 09:27 -0200, Otavio Salvador wrote:

> On Wed, Jan 15, 2014 at 3:57 AM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>         Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>         ---

>          SRCREV_machine ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
>         -SRCREV_meta ?= "778d5f6259f0b8e28a46d8a764979e20e5a8ffc4"
>         +SRCREV_meta ?= "4d658aa580df62232a4a84957b02496436dc17c4"
>         +
> 
> 
> left over new line.


Queued in master-next with that extra newline missing.

Cheers,

Richard



