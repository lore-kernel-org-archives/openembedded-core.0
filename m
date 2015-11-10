Return-Path: <joshua.lock@collabora.co.uk>
X-Greylist: delayed 343 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Nov 2015 22:41:15 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 58DC3766B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 22:41:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 74F946007D3
To: akuster808 <akuster808@gmail.com>
References: <563C0420.6000308@gmail.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <56427131.7040408@collabora.co.uk>
Date: Tue, 10 Nov 2015 22:35:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <563C0420.6000308@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Fido] readline CVE-2014-2524
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
X-List-Received-Date: Tue, 10 Nov 2015 22:41:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/15 01:36, akuster808 wrote:
> please backport from Master
>
> 9a02df0e932106bcb3dda0a7a2eb1113719fb4ee
>
> readline: actually apply readline63-003 (aka CVE-2014-2524)

Thanks, I've queued this in my joshuagl/fido-next branch.

Regards,

Joshua

