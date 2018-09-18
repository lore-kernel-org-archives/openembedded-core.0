Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6560D65CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 13:29:32 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id m84-v6so1754442lje.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=W5aHY7xcUmpt8TzP2LFQWsgPTxzVI5ff21ZprLVu5Es=;
	b=MZlelhxIRjBIO1MqT8pNBZ/1fsd3+uDFKoBmYYcWbLxv5avdSkjzM9PXzpc5zKLkuM
	HekufH1PGwi4UYcfJSpYHeEVT92vNgHWFzNZR+q7Kmm/Itdzf0eHI3mx9BFODcNUvkJP
	rxcZj6MA/WE+ojXwKQD+IIRGcblQrqVDottGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=W5aHY7xcUmpt8TzP2LFQWsgPTxzVI5ff21ZprLVu5Es=;
	b=MoahcusbO0yLG585maqDh9Ki6xjBwZW845IqKfLuhmvyF6MwyklpzpUyigG3Dcx/lb
	DCrwbhQjbRh48s9ZCBFcnoRF6BEsM0vA6wslCwCWJyaMVbHmh7PyLA51EFiEVtPQ7yA3
	dh4ojX81ypLol3DlV2JkF4anpwtChume+TdtjV0zQaLXGx/yhCiNW8YtPtsXPznim5b1
	aYgRWKol1ZZhnoCSh5eczj2KTfDyHtl267WvR0UChFYW4PqLIzNcgpeyrcnqVBq72h0z
	4xZMi9YzQnTT4bWDnC2nkBB8zagnX2Sb2ZYjxLzFsFGjUioSbUARio+Lx0IZtwObLUez
	cKOg==
X-Gm-Message-State: APzg51CJq8ypZ17rXRQTAixnImUy0y6Pw4yOiUu/5qScZzctMA2dXXza
	qrxTVDw4EAljY10p0dNBYzNCRB0ulvn1qSvDSn96qA==
X-Google-Smtp-Source: ANB0VdaWU6LvbK8zAv9eg9FGMs72Q6eOOD3luy+6dxdIXOImGfGUsS1KPMQ5iOUYvzLZCmLnyI7yjitCV8GqiwWV38M=
X-Received: by 2002:a2e:9198:: with SMTP id
	f24-v6mr17862528ljg.64.1537277372543; 
	Tue, 18 Sep 2018 06:29:32 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 18 Sep 2018 15:29:21 +0200
Message-ID: <CAP71WjzxZy4AXfRnMT6Jt6Tf18RfA6goy6qi9E6N5eR_AGM1eg@mail.gmail.com>
To: Yocto list discussion <yocto@yoctoproject.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Demos for the Yocto Project booth at ELCE in Edinburgh
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
X-List-Received-Date: Tue, 18 Sep 2018 13:29:32 -0000
Content-Type: text/plain; charset="UTF-8"

Dear all,

As usual, the Yocto Project will have a booth at the ELCE conference
in Edinburgh next month. While the booth is a great opportunity for
everyone to get a new sticker of your favorite project ;-) we are also
very excited when developers from our community get a chance to show
off the fun and cool things they build thanks to the Yocto Project!

If you want to bring any of your cool demo on the YP booth, please
send me an email so that we can plan and discuss any of the logistics!

Also, don't forget the YP Dev Day Europe, which is right after ELCE,
in Edinburgh, more information can be found here:
https://www.yoctoproject.org/yocto-project-dev-day-europe-2018/

cheers
nico

