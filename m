Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TzvXb-00013X-4H
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 21:42:55 +0100
Received: by mail-ia0-f175.google.com with SMTP id r4so4871116iaj.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 12:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=pfVz4Zkq9lhjFk/lT+6NTkyvswcssVammSF1SKI5iIE=;
	b=QAFdExEMfYVjoHEqjyb/N0S60vRp4B58zQaDi0hCGB+qC01OO85wuB5FudbPyh6zyc
	6A0pDi5K8bTuPC+ysklmuj4yTaPtuiiNv7O8jFAGLmMHPKaEcJTacf4rN7shvQx2WfUY
	Ht4qVdshCUH5AzNQr6Vjz3dkfoDuYDF6QO02MNZUGH3YTtZmUeXTbqm71IC0Afdy9O0I
	LrJGjiriSBMwBmIU9cGJpcnNyLrh2Jf78/OGghQCM04o5dFOA4qt1mQeO3c65UtUXH6w
	qMUVR595sUo+nCZm3V0XrswxUeAe2UO3jhBr6diZwGTjgTeTiv56PVKhmo2zzGNTnDmL
	AV9Q==
X-Received: by 10.50.56.232 with SMTP id d8mr5986381igq.112.1359404835862;
	Mon, 28 Jan 2013 12:27:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Mon, 28 Jan 2013 12:26:45 -0800 (PST)
In-Reply-To: <20130128201023.GH16904@jama.palm1.palmone.com>
References: <cover.1359402980.git.raj.khem@gmail.com>
	<25339fa58dfb08985df8f6b602e00df5d9d576c9.1359402980.git.raj.khem@gmail.com>
	<20130128201023.GH16904@jama.palm1.palmone.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jan 2013 12:26:45 -0800
Message-ID: <CAMKF1srszdP1O7x3_vu0kYiciUKEg8gmFjCj1m4gKgxr3+hxzQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] systemd: Drop ppc build breakage patch for test-unit-file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 20:42:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 28, 2013 at 12:10 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> -PR = "r1"
>> -
>
> ^ PR going backwards

bah merge did not tell me that too bad fixed now in branch

Thanks


