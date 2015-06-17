Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 231C675662
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 11:58:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 5B41C6002A0
Message-ID: <558160FA.1050500@collabora.co.uk>
Date: Wed, 17 Jun 2015 12:58:50 +0100
From: Joshua Lock <joshua.lock@collabora.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1432309362-3275-1-git-send-email-dave.lerner@windriver.com>
	<CA+AhUGx_O0zSnPQbqtH8rUwGDj3ru5zrb68z87Ze00ZKsH8yaw@mail.gmail.com>
In-Reply-To: <CA+AhUGx_O0zSnPQbqtH8rUwGDj3ru5zrb68z87Ze00ZKsH8yaw@mail.gmail.com>
Subject: Re: [PATCH] valgrind: remove arm tests that don't compile
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
X-List-Received-Date: Wed, 17 Jun 2015 11:58:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Erik,

On 11/06/15 09:39, Erik Botö wrote:
> I'd like to see this backported into fido if possible, I saw that it's
> now merged in master.
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=d1ce219960c031c00b48bf454b740b8bffcfbc43

I've queued this in my fido/next[1] branch for inclusion in my next pull 
request.

Regards,

Joshua

1. 
http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next


