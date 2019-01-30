Return-Path: <scott@jumpnowtek.com>
X-Greylist: delayed 454 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Jan 2019 20:16:47 UTC
Received: from smtp109.iad3b.emailsrvr.com (smtp109.iad3b.emailsrvr.com
	[146.20.161.109])
	by mail.openembedded.org (Postfix) with ESMTP id 33C3D7C0BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 20:16:47 +0000 (UTC)
Received: from smtp22.relay.iad3b.emailsrvr.com (localhost [127.0.0.1])
	by smtp22.relay.iad3b.emailsrvr.com (SMTP Server) with ESMTP id
	1EBF760316 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 15:09:15 -0500 (EST)
X-Auth-ID: scott@jumpnowtek.com
Received: by smtp22.relay.iad3b.emailsrvr.com (Authenticated sender:
	scott-AT-jumpnowtek.com) with ESMTPSA id F0215602C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 15:09:14 -0500 (EST)
X-Sender-Id: scott@jumpnowtek.com
Received: from [192.168.10.4] (c-73-234-253-132.hsd1.me.comcast.net
	[73.234.253.132]) (using TLSv1.2 with cipher AES128-SHA)
	by 0.0.0.0:465 (trex/5.7.12); Wed, 30 Jan 2019 15:09:15 -0500
To: openembedded-core@lists.openembedded.org
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
	<CAJ86T=XUqY8+ZAgRpXfd=OXULoOvMb57we6R2Df_b8N7q2csCA@mail.gmail.com>
From: Scott Ellis <scott@jumpnowtek.com>
Message-ID: <7f56f94e-07b0-275e-f152-b5bd1c776094@jumpnowtek.com>
Date: Wed, 30 Jan 2019 15:09:20 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XUqY8+ZAgRpXfd=OXULoOvMb57we6R2Df_b8N7q2csCA@mail.gmail.com>
Subject: Re: [PATCH] busybox: add devmem
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
X-List-Received-Date: Wed, 30 Jan 2019 20:16:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Is the busybox devmem functionally different then the standalone devmem2
package?



