Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8B14460687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 09:18:37 +0000 (UTC)
Received: from [192.168.0.2] (host86-137-86-109.range86-137.btcentralplus.com
	[86.137.86.109]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 9E5999530
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 10:18:37 +0100 (BST)
Message-ID: <51DE786C.8070802@r-finger.com>
Date: Thu, 11 Jul 2013 10:18:36 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130630 Icedove/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
	<1373504197-9550-2-git-send-email-obi@opendreambox.org>
	<CAJTo0LZoTFBJ2LmbhxhNxPBd=FjhG6-BVYRw3L4mqNbemfz3og@mail.gmail.com>
In-Reply-To: <CAJTo0LZoTFBJ2LmbhxhNxPBd=FjhG6-BVYRw3L4mqNbemfz3og@mail.gmail.com>
Subject: Re: [PATCH 2/3] cogl-1.0: make building cogl-pango optional
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
X-List-Received-Date: Thu, 11 Jul 2013 09:18:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/07/13 09:56, Burton, Ross wrote:
> On 11 July 2013 01:56, Andreas Oberritter <obi@opendreambox.org> wrote:
>> Add a 'cogl-pango' PACKAGECONFIG option and enable it by default.
> 
> Really picky, but can we call this just "pango"?

+1 for that; otherwise, these patches makes good sense to me.

Tomas

-- 
http://sleepfive.com

