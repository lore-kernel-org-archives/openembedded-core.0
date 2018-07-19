Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4F98F78A4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 14:21:17 +0000 (UTC)
Received: from [10.1.14.230] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 8CA1215D3;
	Thu, 19 Jul 2018 16:21:17 +0200 (CEST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180719100714.9639-1-dv@pseudoterminal.org>
	<20180719110720.GA1436@jama>
	<1eb8494d-fb4b-1585-3502-4142548345a5@pseudoterminal.org>
	<20180719121252.GB1436@jama>
	<bfaa505c-1ffe-3c22-e0f3-9a06f4fab4bc@pseudoterminal.org>
	<20180719132046.GC1436@jama>
	<26d1dd91-a30d-a8db-61f9-5f1a3cf59520@pseudoterminal.org>
	<20180719140234.GD1436@jama>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <8876df36-d6b9-cff8-1b4d-af4111b05407@pseudoterminal.org>
Date: Thu, 19 Jul 2018 16:21:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180719140234.GD1436@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] gstreamer1.0-plugin-base: Update packageconfigs
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
X-List-Received-Date: Thu, 19 Jul 2018 14:21:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2018-07-19 16:02, Martin Jansa wrote:
> I don't want to continue in this discussion, hopefully someone else will
> add an opinion as well.
>
> Cheers,

I agree. For a v3 of the patches, I'm OK with reintroducing the 
libvisual packageconfig. As for the rest (--disable-twolame etc.), these 
are a separate discussion, one that goes beyond the scope of these 
patches. I propose we worry about that as part of a separate set of patches.

