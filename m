Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UW4Mk-0004xx-Pq
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 14:36:43 +0200
Received: by mail-ee0-f45.google.com with SMTP id l10so2091666eei.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2013 05:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=K2DVZ1VwpDlrkENJHq8Z9s0Jt9LtOGA0DoVn9Hus6eE=;
	b=FHWtLL8JUS5O5oTcynytCkDVfjkOzQ1bdfXRCYA5b7W1muop7ZwgntiMT9AzP+DWEb
	QKnBFjbtFeDPDIU8vczBTOM98wy0Oo2TfAE4UmP/rE1/UMtzM92HWHlOcHDgE14gzn0Q
	V07mDm0A2E/y/cX93ckan1g8zMp2Q81wOjZIjlXUXr4CM/acnFwydL8k29OqPL8gLQ8H
	u7S7FLnjz3KHQrb+MY76e7kuHJduLj+AmfqXIdZmZcp1s5HNlF2nynLxqPAiIRDIuG+l
	XhNSy3BLgbcGLe1sQQhk2JiQ4QUWC0YRRsMrKOGzpCqTye2Uiu4kFyDGmNzFBgi7G3kg
	R2Cg==
X-Received: by 10.15.26.6 with SMTP id m6mr64696670eeu.4.1367065128687;
	Sat, 27 Apr 2013 05:18:48 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id n7sm21571317eeo.0.2013.04.27.05.18.46
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 05:18:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <517BB1B6.1000307@linaro.org>
Date: Sat, 27 Apr 2013 14:18:45 +0200
Message-Id: <D91948D7-E76F-45D9-B3F8-B2297AA8EF12@dominion.thruhere.net>
References: <5E6BBD57-21F8-4282-97F0-567ACFB008CD@dominion.thruhere.net>
	<517BB1B6.1000307@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlbNGSmZDrMdhin/k0RpXcXRx2XWrPwPiTkulRsa4EFAXyoODG+auUY6kqaHTrnz63fuzZI
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Annoyances with dylan
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
X-List-Received-Date: Sat, 27 Apr 2013 12:36:46 -0000
X-List-Received-Date: Sat, 27 Apr 2013 12:36:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 apr. 2013, om 13:08 heeft Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> het volgende geschreven:

> W dniu 26.04.2013 16:47, Koen Kooi pisze:
>=20
>> I have 2 big annoyances with dylan:
>=20
>> To trigger 2) I updated meta-linaro
>=20
> Do you want 'dylan' branch of meta-linaro?

That would make life easier, yes :)



